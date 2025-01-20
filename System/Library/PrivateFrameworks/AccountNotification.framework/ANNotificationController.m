@interface ANNotificationController
- (ANNotificationController)init;
- (id)_clientSideNotifierWithMachServiceName:(id)a3;
- (void)addNotification:(id)a3 withCompletion:(id)a4;
- (void)notificationProvider:(id)a3 didActivateNotification:(id)a4;
- (void)notificationProvider:(id)a3 didDismissNotification:(id)a4;
- (void)removeNotificationWithID:(id)a3 completion:(id)a4;
- (void)removeNotificationsWithEventID:(id)a3 completion:(id)a4;
@end

@implementation ANNotificationController

- (ANNotificationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ANNotificationController;
  v2 = -[ANNotificationController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___ANNotificationProvider);
    notificationProvider = v2->_notificationProvider;
    v2->_notificationProvider = v3;

    -[ANNotificationProvider setDelegate:](v2->_notificationProvider, "setDelegate:", v2);
  }

  return v2;
}

- (void)addNotification:(id)a3 withCompletion:(id)a4
{
}

- (void)removeNotificationWithID:(id)a3 completion:(id)a4
{
  notificationProvider = self->_notificationProvider;
  objc_super v6 = (void (**)(id, uint64_t, void))a4;
  -[ANNotificationProvider removeNotificationWithIdentifier:]( notificationProvider,  "removeNotificationWithIdentifier:",  a3);
  v6[2](v6, 1LL, 0LL);
}

- (void)removeNotificationsWithEventID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  notificationProvider = self->_notificationProvider;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000735C;
  v11[3] = &unk_10000C440;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  -[ANNotificationProvider deliveredNotifications:](notificationProvider, "deliveredNotifications:", v11);
}

- (void)notificationProvider:(id)a3 didActivateNotification:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _ANLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[ANNotificationController notificationProvider:didActivateNotification:]";
    __int16 v16 = 1024;
    int v17 = 76;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Activated notification: %@\"",  buf,  0x1Cu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000765C;
  v11[3] = &unk_10000C468;
  id v12 = v5;
  v13 = self;
  id v10 = v5;
  dispatch_async(v9, v11);
}

- (void)notificationProvider:(id)a3 didDismissNotification:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _ANLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[ANNotificationController notificationProvider:didDismissNotification:]";
    __int16 v16 = 1024;
    int v17 = 91;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Dismissed notification: %@\"",  buf,  0x1Cu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007904;
  v11[3] = &unk_10000C468;
  id v12 = v5;
  v13 = self;
  id v10 = v5;
  dispatch_async(v9, v11);
}

- (id)_clientSideNotifierWithMachServiceName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _ANLogSystem(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ANNotificationController _clientSideNotifierWithMachServiceName:]";
    __int16 v21 = 1024;
    int v22 = 110;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Creating XPC connection to %@...\"",  buf,  0x1Cu);
  }

  uint64_t v6 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v3,  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ANClientCallbackInterface XPCInterface](&OBJC_CLASS___ANClientCallbackInterface, "XPCInterface"));
  -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100007C34;
  v17[3] = &unk_10000C370;
  id v8 = v3;
  id v18 = v8;
  -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v17);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100007C7C;
  v15 = &unk_10000C370;
  id v16 = v8;
  id v9 = v8;
  -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", &v12);
  -[NSXPCConnection resume](v6, "resume", v12, v13, v14, v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( v6,  "remoteObjectProxyWithErrorHandler:",  &stru_10000C4A8));

  return v10;
}

- (void).cxx_destruct
{
}

  ;
}

@end