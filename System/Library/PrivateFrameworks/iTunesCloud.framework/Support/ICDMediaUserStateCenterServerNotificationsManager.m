@interface ICDMediaUserStateCenterServerNotificationsManager
- (ICDMediaUserStateCenterServerNotificationsManager)initWithDelegate:(id)a3;
- (ICDMediaUserStateCenterServerNotificationsManagerDelegate)delegate;
- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3;
- (void)_handleCloudAuthenticationDidChangeNotification;
- (void)_handleHomeUserSettingsDidChangeNotification:(id)a3;
- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3;
- (void)_handleLocalStoreAccountPropertiesDidChangeNotification:(id)a3;
- (void)_handleMusicSettingsChangedNotification;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_setupNotifications;
@end

@implementation ICDMediaUserStateCenterServerNotificationsManager

- (ICDMediaUserStateCenterServerNotificationsManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICDMediaUserStateCenterServerNotificationsManager;
  v5 = -[ICDMediaUserStateCenterServerNotificationsManager init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[ICDMediaUserStateCenterServerNotificationsManager _setupNotifications](v6, "_setupNotifications");
  }

  return v6;
}

- (void)_setupNotifications
{
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2050000000LL;
  v3 = (void *)qword_1001DB858;
  uint64_t v25 = qword_1001DB858;
  if (!qword_1001DB858)
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    uint64_t v19 = (uint64_t)sub_1000FF738;
    v20 = &unk_1001A6978;
    v21 = &v22;
    sub_1000FF738((uint64_t)&v17);
    v3 = (void *)v23[3];
  }

  id v4 = v3;
  _Block_object_dispose(&v22, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v17 = 0LL;
  uint64_t v18 = (uint64_t)&v17;
  uint64_t v19 = 0x2020000000LL;
  v6 = (void *)qword_1001DB868;
  v20 = (void *)qword_1001DB868;
  if (!qword_1001DB868)
  {
    v7 = sub_1000FF7FC();
    v6 = dlsym(v7, "MPHomeUserMonitorPrivateListeningForCurrentDeviceSettingDidChangeNotification");
    *(void *)(v18 + 24) = v6;
    qword_1001DB868 = (uint64_t)v6;
  }

  _Block_object_dispose(&v17, 8);
  if (v6)
  {
    [v5 addObserver:self selector:"_handleHomeUserSettingsDidChangeNotification:" name:*v6 object:0];

LABEL_8:
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:self selector:"_handleSubscriptionStatusDidChangeNotification:" name:ICMusicSubscriptionStatusDidChangeNotification object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:self selector:"_handleActiveUserIdentityDidChangeNotification:" name:ICActiveUserIdentityDidChangeNotification object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:self selector:"_handleLocalStoreAccountPropertiesDidChangeNotification:" name:ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_handleLibraryAuthServiceTokenDidChangeNotification:" name:ICLibraryAuthServiceClientTokenDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000FF900,  ICCloudClientIsAuthenticatedDidChangeNotification,  0LL,  (CFNotificationSuspensionBehavior)0LL);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v14,  self,  (CFNotificationCallback)sub_1000FF908,  @"com.apple.mobileipod-prefsChanged",  0LL,  CFNotificationSuspensionBehaviorDrop);
    return;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPHomeUserMonitorPrivateListeningForCurrentDeviceSettingDidChangeNotification(void)"));
  objc_msgSend( v15,  "handleFailureInFunction:file:lineNumber:description:",  v16,  @"ICDMediaUserStateCenterServerNotificationsManager.m",  22,  @"%s",  dlerror(),  v17);

  __break(1u);
}

- (void)_handleHomeUserSettingsDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    objc_super v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, home user settings changed",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    objc_super v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, library authentication token changed",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleLocalStoreAccountPropertiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    objc_super v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, store account properties changed",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    objc_super v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, identity store changed",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    objc_super v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, subscription status changed",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    objc_super v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, active user identity changed",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleCloudAuthenticationDidChangeNotification
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, cloud authentication changed",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v4 notificationsManager:self didReceiveNotificationChangingUserState:0];
}

- (void)_handleMusicSettingsChangedNotification
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Calling delegate to update user state, music settings changed",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMediaUserStateCenterServerNotificationsManager delegate](self, "delegate"));
  [v4 notificationsManager:self didReceiveNotificationChangingUserState:0];
}

- (ICDMediaUserStateCenterServerNotificationsManagerDelegate)delegate
{
  return (ICDMediaUserStateCenterServerNotificationsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end