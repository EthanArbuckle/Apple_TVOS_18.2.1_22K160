@interface CloudUserNotificationController
- (CloudBadgeControllerProtocol)badgeControllerProtocol;
- (CloudUserNotificationController)init;
- (OS_dispatch_queue)centerQueue;
- (UNUserNotificationCenter)center;
- (id)_createBag;
- (void)badgeAppWithRequest:(id)a3;
- (void)setBadgeControllerProtocol:(id)a3;
- (void)setCenter:(id)a3;
- (void)setCenterQueue:(id)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CloudUserNotificationController

- (CloudUserNotificationController)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CloudUserNotificationController;
  v2 = -[CloudUserNotificationController init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.usernotifications", 0LL);
    centerQueue = v2->_centerQueue;
    v2->_centerQueue = (OS_dispatch_queue *)v3;

    v5 = -[UNUserNotificationCenter initWithBundleIdentifier:queue:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:queue:",  @"com.apple.Music",  v2->_centerQueue);
    center = v2->_center;
    v2->_center = v5;

    -[UNUserNotificationCenter setDelegate:](v2->_center, "setDelegate:", v2);
    -[UNUserNotificationCenter setPrivateDelegate:](v2->_center, "setPrivateDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v2->_center,  "setWantsNotificationResponsesDelivered");
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  @"music-notification-default",  &__NSArray0__struct,  &__NSArray0__struct,  1LL));
    v8 = v2->_center;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    -[UNUserNotificationCenter setNotificationCategories:](v8, "setNotificationCategories:", v9);
  }

  return v2;
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User notification did change settings", v14, 2u);
  }

  uint64_t v15 = ICUserNotificationSettingsAreAuthorizedUserInfoKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v7 authorizationStatus] == (id)2));
  v16 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v11 postNotificationName:ICUserNotificationSettingsDidChangeNotification object:0 userInfo:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUserNotificationController _createBag](self, "_createBag"));
  id v13 =  +[AMSUserNotification notificationCenter:didChangeSettings:bag:]( &OBJC_CLASS___AMSUserNotification,  "notificationCenter:didChangeSettings:bag:",  v6,  v7,  v12);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(void))a5;
  if (+[AMSUserNotification shouldHandleNotificationResponse:]( &OBJC_CLASS___AMSUserNotification,  "shouldHandleNotificationResponse:",  v7))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUserNotificationController _createBag](self, "_createBag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSUserNotification handleNotificationResponse:bag:]( &OBJC_CLASS___AMSUserNotification,  "handleNotificationResponse:bag:",  v7,  v9));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100049088;
    v11[3] = &unk_1001A5880;
    v12 = v8;
    [v10 addFinishBlock:v11];
  }

  else
  {
    v8[2](v8);
  }
}

- (id)_createBag
{
  return +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"Music",  @"1");
}

- (void)badgeAppWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 enabled];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUserNotificationController badgeControllerProtocol](self, "badgeControllerProtocol"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 actionMetricsEvent]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUserNotificationController _createBag](self, "_createBag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudUserNotificationController center](self, "center"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100048DD4;
  v14[3] = &unk_1001A71A8;
  id v15 = v4;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  id v13 = v4;
  [v9 setBadgeCount:v5 withCompletionHandler:v14];
}

- (CloudBadgeControllerProtocol)badgeControllerProtocol
{
  return (CloudBadgeControllerProtocol *)objc_loadWeakRetained((id *)&self->_badgeControllerProtocol);
}

- (void)setBadgeControllerProtocol:(id)a3
{
}

- (UNUserNotificationCenter)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
}

- (OS_dispatch_queue)centerQueue
{
  return self->_centerQueue;
}

- (void)setCenterQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end