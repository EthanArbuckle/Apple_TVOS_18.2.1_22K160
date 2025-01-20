@interface ANNotificationProvider
- (ANNotificationProvider)init;
- (ANNotificationProviderDelegate)delegate;
- (UNUserNotificationCenter)notificationCenter;
- (id)_notificationContent:(id)a3;
- (id)initForSectionWithID:(id)a3;
- (void)deliveredNotifications:(id)a3;
- (void)postNotification:(id)a3 completion:(id)a4;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ANNotificationProvider

- (id)initForSectionWithID:(id)a3
{
  return -[ANNotificationProvider init](self, "init", a3);
}

- (ANNotificationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ANNotificationProvider;
  v2 = -[ANNotificationProvider init](&v6, "init");
  if (v2)
  {
    v3 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.accountnotifications");
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    -[UNUserNotificationCenter setDelegate:](v2->_notificationCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v2->_notificationCenter,  "setWantsNotificationResponsesDelivered");
  }

  return v2;
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ANNotificationProvider _notificationContent:](self, "_notificationContent:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v9,  v8,  0LL));
  uint64_t v12 = _ANLogSystem(v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[ANNotificationProvider postNotification:completion:]";
    __int16 v20 = 1024;
    int v21 = 71;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Posting notification request %@\"",  buf,  0x1Cu);
  }

  notificationCenter = self->_notificationCenter;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000064B0;
  v16[3] = &unk_10000C3D0;
  id v17 = v6;
  id v15 = v6;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( notificationCenter,  "addNotificationRequest:withCompletionHandler:",  v10,  v16);
}

- (id)_notificationContent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _ANLogSystem(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ANNotificationProvider _notificationContent:]";
    __int16 v16 = 1024;
    int v17 = 83;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Generating notification content\"",  buf,  0x12u);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  uint64_t v7 = _ANLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ANNotificationProvider _notificationContent:]";
    __int16 v16 = 1024;
    int v17 = 95;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"We are on TVOS, we can only provide lite content\"",  buf,  0x12u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryRepresentation", @"ANAccountNotificationDictionaryRepresentationKey"));
  v13 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  -[UNMutableNotificationContent setUserInfo:](v6, "setUserInfo:", v10);

  return v6;
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _ANLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    *(_DWORD *)buf = 136315650;
    v13 = "-[ANNotificationProvider removeNotificationWithIdentifier:]";
    __int16 v14 = 1024;
    int v15 = 104;
    __int16 v16 = 2112;
    int v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Removing notification %@\"",  buf,  0x1Cu);
  }

  notificationCenter = self->_notificationCenter;
  id v10 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:]( notificationCenter,  "removePendingNotificationRequestsWithIdentifiers:",  v9);
}

- (void)deliveredNotifications:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  uint64_t v4 = _ANLogSystem();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[ANNotificationProvider deliveredNotifications:]";
    __int16 v10 = 1024;
    int v11 = 112;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Fetching delivered notifications\"",  (uint8_t *)&v8,  0x12u);
  }

  uint64_t v6 = _ANLogSystem();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[ANNotificationProvider deliveredNotifications:]";
    __int16 v10 = 1024;
    int v11 = 129;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"We are on TVOS, we are unable to fetch delivered notifications\"",  (uint8_t *)&v8,  0x12u);
  }

  v3[2](v3, &__NSArray0__struct);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(void))a5;
  uint64_t v8 = _ANLogSystem();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[ANNotificationProvider userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v14 = 1024;
    int v15 = 137;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"Recieved notification response %@\"",  (uint8_t *)&v12,  0x1Cu);
  }

  uint64_t v10 = _ANLogSystem();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    v13 = "-[ANNotificationProvider userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v14 = 1024;
    int v15 = 157;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s (%d) \"We are on tvos, nothing to do here\"",  (uint8_t *)&v12,  0x12u);
  }

  v7[2](v7);
}

- (ANNotificationProviderDelegate)delegate
{
  return (ANNotificationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end