@interface FAUserNotificationProvider
- (BOOL)customCategoryForNotification:(id)a3;
- (FAUserNotificationProvider)init;
- (FAUserNotificationProviderDelegate)delegate;
- (NSLock)categoryLock;
- (UNUserNotificationCenter)notificationCenter;
- (id)_customCategoryIdentifierForNotification:(id)a3;
- (id)_notificationContent:(id)a3;
- (void)deliveredNotifications:(id)a3;
- (void)postNotification:(id)a3;
- (void)setCategoryLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)tearDownNotificationWithIdentifier:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation FAUserNotificationProvider

- (FAUserNotificationProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FAUserNotificationProvider;
  v2 = -[FAUserNotificationProvider init](&v13, "init");
  if (v2)
  {
    v3 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.familynotifications");
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = v3;

    -[UNUserNotificationCenter setDelegate:](v2->_notificationCenter, "setDelegate:", v2);
    id v5 = -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v2->_notificationCenter,  "setWantsNotificationResponsesDelivered");
    uint64_t v7 = _FALogSystem(v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "We are on tvos, not setting categories",  v12,  2u);
    }

    v9 = objc_alloc_init(&OBJC_CLASS___NSLock);
    categoryLock = v2->_categoryLock;
    v2->_categoryLock = v9;
  }

  return v2;
}

- (void)postNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAUserNotificationProvider _notificationContent:](self, "_notificationContent:", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v6,  v5,  0LL));
  uint64_t v10 = _FALogSystem(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    objc_super v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Posting notification request %@",  (uint8_t *)&v12,  0xCu);
  }

  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( self->_notificationCenter,  "addNotificationRequest:withCompletionHandler:",  v7,  &stru_1000083B0);
}

- (id)_notificationContent:(id)a3
{
  id v3 = a3;
  uint64_t v5 = _FALogSystem(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Generating notification content", v15, 2u);
  }

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  uint64_t v9 = _FALogSystem(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "We are on TVOS, we can only provide lite content",  v15,  2u);
  }

  v16[0] = @"FAFamilyNotificationUUIDKey";
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
  v16[1] = @"FAFamilyNotificationAsDictionaryKey";
  v17[0] = v11;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v3 cacheDictionaryRepresentation]);

  v17[1] = v12;
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  -[UNMutableNotificationContent setUserInfo:](v7, "setUserInfo:", v13);

  return v7;
}

- (void)tearDownNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tearing down notification %@:", buf, 0xCu);
  }

  notificationCenter = self->_notificationCenter;
  id v10 = v4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:]( notificationCenter,  "removePendingNotificationRequestsWithIdentifiers:",  v9);
}

- (void)deliveredNotifications:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  uint64_t v4 = _FALogSystem();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching delivered notifications", buf, 2u);
  }

  uint64_t v6 = _FALogSystem();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "We are on tvos, we cannot grab delivered notifications",  v8,  2u);
  }

  v3[2](v3, &__NSArray0__struct);
}

- (id)_customCategoryIdentifierForNotification:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 uuid]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.familynotifications",  v3));

  return v4;
}

- (BOOL)customCategoryForNotification:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 actionButtonLabel]);
  if (v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 otherButtonLabel]);
    BOOL v5 = v6 != 0LL;
  }

  return v5;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(void))a5;
  uint64_t v8 = _FALogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received notification response - %@",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v10 = _FALogSystem();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We are on tvos, nothing to do here",  (uint8_t *)&v12,  2u);
  }

  v7[2](v7);
}

- (FAUserNotificationProviderDelegate)delegate
{
  return (FAUserNotificationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NSLock)categoryLock
{
  return self->_categoryLock;
}

- (void)setCategoryLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end