@interface NotificationController
+ (id)sharedController;
- (id)xpcConnectionForClientWithMachServiceName:(id)a3;
- (void)_allPendingNotificationsSortedByDate:(id)a3;
- (void)allPendingNotificationsWithCompletion:(id)a3;
- (void)deliverNotification:(id)a3;
- (void)pendingNotificationsForClient:(id)a3 withCompletion:(id)a4;
- (void)provider:(id)a3 didActivateNotification:(id)a4;
- (void)provider:(id)a3 didDismissNotification:(id)a4;
- (void)removeAllNotificationsFromClient:(id)a3;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)start;
@end

@implementation NotificationController

+ (id)sharedController
{
  if (qword_10000DA08 != -1) {
    dispatch_once(&qword_10000DA08, &stru_100008298);
  }
  return (id)qword_10000DA00;
}

- (void)start
{
  v3 = objc_alloc_init(&OBJC_CLASS___FAUserNotificationProvider);
  notificationProvider = self->_notificationProvider;
  self->_notificationProvider = v3;

  -[FAUserNotificationProvider setDelegate:](self->_notificationProvider, "setDelegate:", self);
}

- (void)deliverNotification:(id)a3
{
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing notification with identifier: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[FAUserNotificationProvider tearDownNotificationWithIdentifier:]( self->_notificationProvider,  "tearDownNotificationWithIdentifier:",  v4);
}

- (void)removeAllNotificationsFromClient:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing all notifications for client: %@",  buf,  0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004C14;
  v8[3] = &unk_1000082E8;
  v8[4] = self;
  -[NotificationController pendingNotificationsForClient:withCompletion:]( self,  "pendingNotificationsForClient:withCompletion:",  v4,  v8);
}

- (void)pendingNotificationsForClient:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _FALogSystem(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetch pending notifications for client: %@",  buf,  0xCu);
  }

  notificationProvider = self->_notificationProvider;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100004DD8;
  v14[3] = &unk_100008310;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  -[FAUserNotificationProvider deliveredNotifications:](notificationProvider, "deliveredNotifications:", v14);
}

- (void)allPendingNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching all notifications", v8, 2u);
  }

  -[NotificationController _allPendingNotificationsSortedByDate:](self, "_allPendingNotificationsSortedByDate:", v4);
}

- (void)_allPendingNotificationsSortedByDate:(id)a3
{
  id v4 = a3;
  notificationProvider = self->_notificationProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004FF4;
  v7[3] = &unk_100008250;
  id v8 = v4;
  id v6 = v4;
  -[FAUserNotificationProvider deliveredNotifications:](notificationProvider, "deliveredNotifications:", v7);
}

- (void)provider:(id)a3 didActivateNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = v7;
  if (!v7)
  {
    uint64_t v15 = _FALogSystem(0LL, v8);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    id v16 = (void *)objc_claimAutoreleasedReturnValue([0 uuid]);
    int v24 = 138412290;
    v25 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NotificationController: Did not find pending notification to activate with UUID %@",  (uint8_t *)&v24,  0xCu);
LABEL_10:

    goto LABEL_11;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 activateActionURL]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activateActionURL]);
    uint64_t v26 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v27 = &__kCFBooleanTrue;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    [v11 openSensitiveURL:v12 withOptions:v13];

    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    -[NotificationController removeNotificationWithIdentifier:](self, "removeNotificationWithIdentifier:", v14);
    goto LABEL_11;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 delegateMachServiceName]);

  uint64_t v20 = _FALogSystem(v18, v19);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 delegateMachServiceName]);
      int v24 = 138412290;
      v25 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Attempting to wake up delegate at %@",  (uint8_t *)&v24,  0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v9 delegateMachServiceName]);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NotificationController xpcConnectionForClientWithMachServiceName:]( self,  "xpcConnectionForClientWithMachServiceName:",  v23));

    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s remoteObjectProxyWithErrorHandler:]( v14,  "remoteObjectProxyWithErrorHandler:",  &stru_100008350));
    [v16 didActivateNotification:v9];
    goto LABEL_10;
  }

  if (v21)
  {
    int v24 = 138412290;
    v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NotificationController: No action was configured for activated notification %@",  (uint8_t *)&v24,  0xCu);
  }

- (void)provider:(id)a3 didDismissNotification:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dismissActionlURL]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dismissActionlURL]);
    [v7 openURL:v8];
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 delegateMachServiceName]);

  if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 delegateMachServiceName]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NotificationController xpcConnectionForClientWithMachServiceName:]( self,  "xpcConnectionForClientWithMachServiceName:",  v12));

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxyWithErrorHandler:&stru_100008370]);
    [v8 didDismissNotification:v5];
    goto LABEL_7;
  }

  uint64_t v13 = _FALogSystem(v10, v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
    int v14 = 138412290;
    uint64_t v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "NotificationController: Did not find pending notification to dismiss with UUID %@",  (uint8_t *)&v14,  0xCu);
    goto LABEL_7;
  }

- (id)xpcConnectionForClientWithMachServiceName:(id)a3
{
  id v3 = a3;
  id v4 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v3,  4096LL);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___FAFamilyNotifierRemoteObjectProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v5);
  -[NSXPCConnection resume](v4, "resume");

  return v4;
}

- (void).cxx_destruct
{
}

@end