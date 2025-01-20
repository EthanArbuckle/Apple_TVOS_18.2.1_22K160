@interface ConnectionReceiver
+ (ConnectionReceiver)sharedReceiver;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)connectionListener;
- (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5;
- (void)checkDownloadQueueWithContentType:(int64_t)a3 completion:(id)a4;
- (void)didReceiveStorePushNotificationWithPayload:(id)a3;
- (void)resetAccountWithType:(int64_t)a3;
- (void)restartAPNSConnection;
- (void)setConnectionListener:(id)a3;
- (void)start;
@end

@implementation ConnectionReceiver

+ (ConnectionReceiver)sharedReceiver
{
  if (qword_10003A988 != -1) {
    dispatch_once(&qword_10003A988, &stru_100030740);
  }
  return (ConnectionReceiver *)(id)qword_10003A990;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionReceiver connectionListener](self, "connectionListener"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v4) {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class(self);
      id v6 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting connection listener",  (uint8_t *)&v10,  0xCu);
    }

    v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.askpermissiond");
    -[ConnectionReceiver setConnectionListener:](self, "setConnectionListener:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionReceiver connectionListener](self, "connectionListener"));
    [v8 setDelegate:self];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionReceiver connectionListener](self, "connectionListener"));
    [v9 resume];
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = (id)objc_opt_class(self);
    __int16 v22 = 2114;
    id v23 = v7;
    id v10 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Accepting new connection. Connection: %{public}@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ConnectionProtocol));
  [v7 setExportedInterface:v11];
  objc_initWeak((id *)buf, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100008EF8;
  v18[3] = &unk_100030768;
  objc_copyWeak(&v19, (id *)buf);
  [v7 setInvalidationHandler:v18];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_100008FF0;
  v16 = &unk_100030768;
  objc_copyWeak(&v17, (id *)buf);
  [v7 setInterruptionHandler:&v13];
  objc_msgSend(v7, "setExportedObject:", self, v13, v14, v15, v16);
  [v7 resume];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v20 = (id)objc_opt_class(self);
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    id v13 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Add request. URL: %{public}@, account: %{public}@",  buf,  0x20u);
  }

  uint64_t v14 = -[PostRequestTask initWithRequestURL:account:]( objc_alloc(&OBJC_CLASS___PostRequestTask),  "initWithRequestURL:account:",  v8,  v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PostRequestTask perform](v14, "perform"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000092A0;
  v17[3] = &unk_100030790;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  [v15 addFinishBlock:v17];
}

- (void)resetAccountWithType:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedFrameworkConfig](&OBJC_CLASS___APLogConfig, "sharedFrameworkConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class(self);
    __int16 v15 = 2050;
    int64_t v16 = a3;
    id v7 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Reset account with type: %{public}ld",  buf,  0x16u);
  }

  if (a3 == 1)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___ResetRequesterAccountTask);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResetRequesterAccountTask perform](v8, "perform"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100009648;
    v12[3] = &unk_1000307B8;
    v12[4] = self;
    [v9 addFinishBlock:v12];
  }

  else
  {
    if (a3) {
      return;
    }
    id v8 = (ResetRequesterAccountTask *)objc_claimAutoreleasedReturnValue( +[APLogConfig sharedDaemonConfig]( &OBJC_CLASS___APLogConfig,  "sharedDaemonConfig"));
    if (!v8) {
      id v8 = (ResetRequesterAccountTask *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResetRequesterAccountTask OSLogObject](v8, "OSLogObject"));
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v14 = v10;
      id v11 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "%{public}@: Cannot reset approver account, unsupported device platform",  buf,  0xCu);
    }
  }
}

- (void)checkDownloadQueueWithContentType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = (id)objc_opt_class(self);
    id v9 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Checking download queue.",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ExtensionManager sharedExtensionManager](&OBJC_CLASS___ExtensionManager, "sharedExtensionManager"));
  id v24 = 0LL;
  unsigned int v11 = [v10 checkDownloadQueueWithContentType:a3 error:&v24];
  id v12 = v24;

  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v14 = (void *)v13;
  if (v11)
  {
    if (!v13) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v16 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v26 = v16;
      id v17 = v16;
      id v18 = "%{public}@: Checked download queue succesfully.";
      id v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      uint32_t v21 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    }
  }

  else
  {
    if (!v13) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v22 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      id v26 = v22;
      __int16 v27 = 2114;
      id v28 = v12;
      id v17 = v22;
      id v18 = "%{public}@: Fail to check download queue with error: %{public}@.";
      id v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 22;
      goto LABEL_14;
    }
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_sanitizedForSecureCoding"));
  v6[2](v6, v23);
}

- (void)restartAPNSConnection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[RemoteNotificationHandler sharedHandler](&OBJC_CLASS___RemoteNotificationHandler, "sharedHandler"));
  [v2 start];
}

- (void)didReceiveStorePushNotificationWithPayload:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class(self);
    __int16 v11 = 2114;
    id v12 = v4;
    id v7 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received store push notification. Payload: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RemoteNotificationHandler sharedHandler](&OBJC_CLASS___RemoteNotificationHandler, "sharedHandler"));
  [v8 handleLegacyStoreNotificationPayload:v4];
}

- (NSXPCListener)connectionListener
{
  return self->_connectionListener;
}

- (void)setConnectionListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end