@interface NotifierInterface
- (NSString)clientIdentifier;
- (NSString)delegateMachServiceName;
- (NotifierInterface)initWithXPCConnection:(id)a3;
- (void)deliverNotificaton:(id)a3;
- (void)pendingNotificationsWithIdentifier:(id)a3 replyBlock:(id)a4;
- (void)removeAllNotifications;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDelegateMachServiceName:(id)a3;
@end

@implementation NotifierInterface

- (NotifierInterface)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NotifierInterface;
  v6 = -[NotifierInterface init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_conn, a3);
  }

  return v7;
}

- (void)deliverNotificaton:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString uniqueIdentifier](&OBJC_CLASS___NSString, "uniqueIdentifier"));
  [v4 setUuid:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotifierInterface clientIdentifier](self, "clientIdentifier"));
  [v4 setClientIdentifier:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NotifierInterface delegateMachServiceName](self, "delegateMachServiceName"));
  [v4 setDelegateMachServiceName:v7];

  uint64_t v8 = _FALogSystem();
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Delivering %@", (uint8_t *)&v11, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  [v10 deliverNotification:v4];
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _FALogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  [v6 removeNotificationWithIdentifier:v3];
}

- (void)removeAllNotifications
{
  uint64_t v3 = _FALogSystem(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing all notifications", v7, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NotifierInterface clientIdentifier](self, "clientIdentifier"));
  [v5 removeAllNotificationsFromClient:v6];
}

- (void)pendingNotificationsWithIdentifier:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _FALogSystem(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Returning pending notifications for identifier %@",  buf,  0xCu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000484C;
  v14[3] = &unk_100008278;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)delegateMachServiceName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDelegateMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end